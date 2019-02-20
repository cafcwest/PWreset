# PWreset
Use PowerShell to help reset your password to your current password

Your corporate Information Security would not be a fan of this, so use at your own risk!

This script allows you to cycle through random passwords so that you can ultimately reset your password back to your current password.  Currently it is configured for 10 iterations.  If your corporate Active Directory settings retains a larger number of password histories, you will need to perform some copy/paste magic to iterate a greater number.  

You must install AD Administrative tools in order to use the cmd in the script - there is also a script here to do this 'one-click'.  This was something I found online.  Credit to whomever, sorry, I did not save the source to give them adequate credit.

The script has decent instructions in the commments (and just a little snark) - it should guide you through operation.   Being blunt, if the script operation doesn't make sense, you probably shouldn't be messing with this.

Happy bad security practices!
