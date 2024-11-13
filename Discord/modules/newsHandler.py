import nextcord
from nextcord.ext import commands
import configparser

config = configparser.ConfigParser()
config.read('config.ini')

class NewsHandler(commands.Cog):
    def __init__(self, bot):
        self.bot = bot

    async def sendNews(self, news: str):
        channel_id = config.getint("general", "news_channel_id")
        channel = self.bot.get_channel(channel_id)

        if channel:
            embed = nextcord.Embed(title="BREAKING NEWS!", description=news, color=nextcord.Color.orange())

            await channel.send(embed=embed)
        else:
            print(f"Channel with ID {channel_id} not found. Make sure the bot has access to it.")

    async def updateStatus(self, status: bool):
        channel_id = config.getint("general", "news_channel_id")
        channel = self.bot.get_channel(channel_id)

        if status:
            embed = nextcord.Embed(
                title="Good Morning!",
                description="You're tuned into Weazel News LIVE! Bringing you the latest updates right as they happen.",
                color=nextcord.Color.green()
            )
        else:
            embed = nextcord.Embed(
                title="Good Night!",
                description="Thanks for joining us today. Weazel News wishes you a peaceful and restful night.",
                color=nextcord.Color.red()
            )

        await channel.send(embed=embed)

def setup(bot):
    bot.add_cog(NewsHandler(bot))
