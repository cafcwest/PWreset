## Instructions
## If you work remote you need to be connected to VPN while using this script.  
## You should also close Outlook and other AD/SSO apps so that they don't keep pestering you for credentials as your password cycles.
##
## To identify your true User ID (not just an alias) you can uncomment and use the below to test.
## Get-ADUser -Identity $UserID -Server "domain.forest.com"
##
## Enter your Active Directory user ID below.
$UserID = 'userId'
##
## Set your current password and your intended (new) password below replacing 'xxx'.   Yes it's plain text.  Yes this isn't a best practices - then again, you are the one re-using your password over and over.  Hypocrite!
$CurrentPassword = 'password' | ConvertTo-SecureString -AsPlainText -Force
$NewPassword = 'password' | ConvertTo-SecureString -AsPlainText -Force
##
## Set your iteration interval between passwords here.  Some companies may only allow you to reset your password once every 60 minutes or such.  The measurement here is seconds, so 1 hour = 3600.  If this is your first time using, try resetting your password twice through CTRL+ALT+DEL to see if there is enforcement of time between resets.
$IterationInterval = 60
##
## The scripting below is set to iterate through 10 random passwords then set to your New password.  If your corporate Active Directory stores more than your last 10 passwords, you will need to perform some copy/paste magic to create more random passwords and then perform the password change operation to get the correct number of iterations.
##
## Use at your own risk, ya bum!
##
$RandomPassword1 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword1: $RandomPassword1"
$RandomSecurePassword1 = $RandomPassword1 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword2 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword2: $RandomPassword2"
$RandomSecurePassword2 = $RandomPassword2 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword3 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword3: $RandomPassword3"
$RandomSecurePassword3 = $RandomPassword3 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword4 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword4: $RandomPassword4"
$RandomSecurePassword4 = $RandomPassword4 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword5 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword5: $RandomPassword5"
$RandomSecurePassword5 = $RandomPassword5 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword6 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword6: $RandomPassword6"
$RandomSecurePassword6 = $RandomPassword6 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword7 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword7: $RandomPassword7"
$RandomSecurePassword7 = $RandomPassword7 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword8 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword8: $RandomPassword8"
$RandomSecurePassword8 = $RandomPassword8 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword9 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword9: $RandomPassword9"
$RandomSecurePassword9 = $RandomPassword9 | ConvertTo-SecureString -AsPlainText -Force
#
$RandomPassword10 = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | sort {Get-Random})[0..12] -join ''
Write-Host -Verbose "This is RandomPassword10: $RandomPassword10"
$RandomSecurePassword10 = $RandomPassword10 | ConvertTo-SecureString -AsPlainText -Force
##
##
## Let's start resetting passwords!
##
##
## Iteration 1
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $CurrentPassword -NewPassword $RandomSecurePassword1
Write-Host -Verbose "Reset #1"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword1"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword1"
    Write-Warning $_.Exception.Message
}

## Iteration 2
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword1 -NewPassword $RandomSecurePassword2
Write-Host -Verbose "Reset #2"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword2"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword2.  Your password is still $RandomPassword1"
    Write-Warning $_.Exception.Message
}

## Iteration 3
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword2 -NewPassword $RandomSecurePassword3
Write-Host -Verbose "Reset #3"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword3"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword3.  Your password is still $RandomPassword2"
    Write-Warning $_.Exception.Message
}

## Iteration 4
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword3 -NewPassword $RandomSecurePassword4
Write-Host -Verbose "Reset #4"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword4"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword4.  Your password is still $RandomPassword3"
    Write-Warning $_.Exception.Message
}

## Iteration 5
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword4 -NewPassword $RandomSecurePassword5
Write-Host -Verbose "Reset #5"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword5"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword5.  Your password is still $RandomPassword4"
    Write-Warning $_.Exception.Message
}

## Iteration 6
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword5 -NewPassword $RandomSecurePassword6
Write-Host -Verbose "Reset #6"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword6"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword6.  Your password is still $RandomPassword5"
    Write-Warning $_.Exception.Message
}

## Iteration 7
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword6 -NewPassword $RandomSecurePassword7
Write-Host -Verbose "Reset #7"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword7"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword7.  Your password is still $RandomPassword6"
    Write-Warning $_.Exception.Message
}

## Iteration 8
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword7 -NewPassword $RandomSecurePassword8
Write-Host -Verbose "Reset #8"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword8"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword8.  Your password is still $RandomPassword7"
    Write-Warning $_.Exception.Message
}

## Iteration 9
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword8 -NewPassword $RandomSecurePassword9
Write-Host -Verbose "Reset #9"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword9"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword9.  Your password is still $RandomPassword8"
    Write-Warning $_.Exception.Message
}

## Iteration 10
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword9 -NewPassword $RandomSecurePassword10
Write-Host -Verbose "Reset #10"
Write-Host -Verbose "If I blow up right now, your current password is probably: $RandomPassword10"
Write-Host -Verbose "Waiting $IterationInterval seconds for this password to replicate across the domain before we reset it again"
Write-Host -Verbose "`n"
Start-Sleep -Seconds $IterationInterval
}
Catch {
    Write-Warning "Failed to reset password to $RandomPassword10.  Your password is still $RandomPassword9"
    Write-Warning $_.Exception.Message
}

## End-Goal Password
Try {
Set-ADAccountPassword -Identity $UserID -OldPassword $RandomSecurePassword10 -NewPassword $NewPassword
Write-Host -Verbose "Reset to the intended password"
Write-Host -Verbose "If you see this you have successfully set your password to what was specified in the NewPassword variable.  Congrats!  Now go back and take your password out of this file at the beginning and save it again, so that you don't have your password stored here in plain text, ya bum!"
}
Catch {
    Write-Warning "Failed to reset password to $NewPassword.  Your password is still $RandomPassword10"
    Write-Warning $_.Exception.Message
}
