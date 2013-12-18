Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

################################################################
# Modules
################################################################

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
Import-Module posh-git
Import-Module posh-npm

################################################################
# Prompt Config
################################################################

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
	
	# Write-Host($pwd.ProviderPath) -nonewline
    Write-Host("$ $(Split-Path $pwd -Leaf)") -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Enable-GitColors
Pop-Location
Start-SshAgent -Quiet
Set-ExecutionPolicy Unrestricted

################################################################
# Utility Functions
################################################################

# Set location to the C: drive
function GoTo-CDrive {
	iex "cd C:\"
}

# Set location to the Desktop
function GoTo-Desktop {
	iex "cd ~/Desktop"
}

# Set location to the Downloads folder
function GoTo-Downloads {
    iex "cd ~/Downloads"
}

# Set location to the C:\_Projects directory.
function GoTo-Projects {
	iex "cd C:/_Projects"
}

# Set location to the Dropbox
function GoTo-Dropbox {
	iex "cd ~/Dropbox"
}

# Set location to user folder
function GoTo-Home {
	iex "cd ~/"
}

# Reload the powershell session
function Reload-PowerShell {

}

################################################################
# Aliases
################################################################

Set-Alias subl 'C:\Program Files\Sublime Text 3\sublime_text.exe'
Set-Alias p GoTo-Projects
Set-Alias dt GoTo-Desktop
Set-Alias dl GoTo-Downloads
Set-Alias c GoTo-CDrive
Set-Alias db GoTo-Dropbox
Set-Alias home GoTo-Home
Set-Alias reload Reload-PowerShell