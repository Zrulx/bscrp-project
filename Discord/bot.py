import nextcord
from nextcord.ext import commands
import os
import threading
import asyncio
import random
from flask import Flask, request, jsonify
import configparser

# Initialize the bot
intents = nextcord.Intents.all()
bot = commands.Bot(command_prefix="*", intents=intents)

# Initialize Flask app
app = Flask(__name__)

config = configparser.ConfigParser()
config.read('config.ini')

@app.route('/send_news', methods=['POST'])
async def receive_news():
    data = request.get_json()
    
    discord_id = data.get('discord_id')
    death_cause = data.get('death_cause')
    death_location = data.get('death_location')

    cause_phrases = eval(config.get("phrases", "cause_phrases"))
    intro_phrases = eval(config.get("phrases", "intro_phrases"))
    location_phrases = eval(config.get("phrases", "location_phrases"))

    cause_phrases_list = cause_phrases.get(death_cause, [])

    if not cause_phrases_list:
        cause_phrases_list = [f"Sadly, the cause of death for <@{discord_id}> remains unknown."]

    cause_phrase = random.choice(cause_phrases_list)

    news_content = f"{random.choice(intro_phrases).format(discord_id=discord_id)} {cause_phrase.format(death_cause=[death_cause])} {random.choice(location_phrases).format(death_location=death_location)}"

    asyncio.run_coroutine_threadsafe(
        bot.get_cog("NewsHandler").sendNews(news_content),
        bot.loop
    )

    return jsonify({"status": "success"}), 200


@app.route('/update_status', methods=['POST'])
async def update_status():
    data = request.get_json()

    status = data.get('status')

    asyncio.run_coroutine_threadsafe(
        bot.get_cog("NewsHandler").updateStatus(status),
        bot.loop
    )

    return jsonify({"status": "success"}), 200

def run_flask():
    app.run(port=5000, use_reloader=False)

# Load bot extensions
loaded_count = 0
total_count = 0

for filename in os.listdir('./modules'):
    if filename.endswith('.py'):
        total_count += 1
        extension = f'modules.{filename[:-3]}'
        try:
            bot.load_extension(extension)
            loaded_count += 1
        except Exception as e:
            print(f'Failed to load extension {extension}: {e}')

# Bot on_ready event
@bot.event
async def on_ready():
    print(f"Logged in as {bot.user} | Loaded {loaded_count}/{total_count} Modules")

# Main entry point for running both Flask and the bot
if __name__ == "__main__":
    # Start Flask in a separate thread
    flask_thread = threading.Thread(target=run_flask)
    flask_thread.start()

    bot.run("Token")