import nextcord
from nextcord.ext import commands
import os
import threading
import asyncio
import random
from flask import Flask, request, jsonify

# Initialize the bot
intents = nextcord.Intents.all()
bot = commands.Bot(command_prefix="*", intents=intents)

# Initialize Flask app
app = Flask(__name__)

# Flask route to handle incoming news
@app.route('/send_news', methods=['POST'])
async def receive_news():
    data = request.get_json()
    
    discord_id = data.get('discord_id')
    death_cause = data.get('death_cause')
    death_location = data.get('death_location')

    intro_phrases = [
        f"Breaking news! <@{discord_id}> met an unfortunate end.",
        f"Tragedy strikes! Our dear <@{discord_id}> has fallen.",
        f"Sad news from the battlefield: <@{discord_id}> has perished.",
    ]

    cause_phrases = [
        f"The cause? {death_cause} claimed their life.",
        f"A fatal {death_cause} was to blame.",
        f"They couldn’t survive the {death_cause}.",
    ]

    location_phrases = [
        f"This happened near {death_location}.",
        f"At the scene: {death_location}.",
        f"Location of death: {death_location}.",
    ]

    news_content = f"{random.choice(intro_phrases)} {random.choice(cause_phrases)} {random.choice(location_phrases)}"

    # Call sendNews asynchronously from Flask
    if bot:
        asyncio.run_coroutine_threadsafe(
            bot.get_cog("NewsHandler").sendNews(news_content),
            bot.loop
        )

    return jsonify({"status": "success"}), 200

# Function to run Flask in a separate thread
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