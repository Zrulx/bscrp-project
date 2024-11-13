import nextcord
from nextcord.ext import commands


class NewsHandler(commands.Cog):
    def __init__(self, bot):
        self.bot = bot

    async def sendNews(self, news: str):
        channel_id = 1306168534447161355
        channel = self.bot.get_channel(channel_id)
        
        if channel:
            await channel.send(news)
        else:
            print(f"Channel with ID {channel_id} not found. Make sure the bot has access to it.")
        

    

def setup(bot):
    bot.add_cog(NewsHandler(bot))
