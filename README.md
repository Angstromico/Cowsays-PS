CowPS
=====

_This is a native PowerShell port of cowpy, the Python cowsay implementation._

[Install](#install)  
[Module Usage](#module-usage)  
[CLI Usage](#cli-usage)  
[Available Cowacters](#available-cowacters)    

## Install

To install the module, copy the `CowPS` directory to one of your PowerShell module paths (e.g., `$HOME\Documents\PowerShell\Modules\`), or import it directly:

```powershell
Import-Module Path\To\CowPS
```

*(Once published to the PowerShell Gallery, you will be able to install it via `Install-Module -Name CowPS`)*

## What's the point?

`CowPS` brings the classic `cowsay` experience natively to PowerShell! It generates speech/thought bubbles around text accompanied by cute ASCII art characters ("cowacters"). 

Unlike other ports, `CowPS` supports:
- 40+ classic cowacters
- Custom eyes and tongues
- Random cowacters
- Programmatic API as well as a flexible pipeline-friendly CLI

## Module Usage

You can use the exported functions programmatically in your PowerShell scripts:

```powershell
# Create a cowacter object
$moose = New-Cowacter -Name 'moose'

# Get a cowsay message by milking the cow
$msg = $moose.Milk("My witty message")
Write-Output $msg

# Create a cow with a thought bubble
$mooseWithThoughts = New-Cowacter -Name 'moose' -Thoughts
$msg = $mooseWithThoughts.Milk("My witty message, with thought")
Write-Output $msg

# Create a cow with a tongue
$mooseWithTongue = New-Cowacter -Name 'moose' -Tongue
$msg = $mooseWithTongue.Milk("My witty message, with tongue")
Write-Output $msg

# Create a cow with dead eyes
$deadMoose = New-Cowacter -Name 'moose' -Eyes 'dead'
$msg = $deadMoose.Milk("my witty message, I'm dead")
Write-Output $msg

# Get all available eye options
$eyes = Get-EyeOptions
Write-Output $eyes

# Get all available cowacter names
$cows = Get-CowacterList
Write-Output $cows
```

## CLI Usage

The main cmdlet is `Invoke-CowSay` (aliased to `cowps`). It supports pipeline input:

```powershell
"PowerShell is awesome!" | Invoke-CowSay
```
or
```powershell
Invoke-CowSay -Message "PowerShell is awesome!"
# Or using the alias:
cowps "PowerShell is awesome!"
```

### CLI Parameters

```text
-Message <string[]>
    The message to display.

-Cowacter <string>
    Specify which cowacter to use. Default is 'default'.

-Eyes <string>
    Use a specific eye style (default, dead, stoned, greedy, paranoid, tired, wired, young).

-Thoughts
    Use a thought bubble instead of a speech bubble.

-Tongue
    Add a tongue to the cowacter (if supported).

-Random
    Choose a cowacter and style at random.

-IncludeNsfw
    Include NSFW cowacters/eyes (e.g., when choosing random or listing).

-ListCowacters
    Output all available cowacters.

-ListVariations
    Output all available cowacters with all eye options.

-ListEyes
    Print a listing of the available eye types.
```

## Available Cowacters

`CowPS` supports over 40+ cowacters including:

- `default`
- `beavis`
- `budfrogs`
- `bunny`
- `cheese`
- `cower`
- `daemon`
- `dragonandcow`
- `eyes`
- `flamingsheep`
- `ghostbusters`
- `hellokitty`
- `kiss`
- `kitty`
- `koala`
- `kosh`
- `lukekoala`
- `mechandcow`
- `meow`
- `milk`
- `moofasa`
- `moose`
- `mutilated`
- `ren`
- `satanic`
- `sheep`
- `skeleton`
- `small`
- `squirrel`
- `stegosaurus`
- `stimpy`
- `supermilker`
- `surgery`
- `threeeyes`
- `turkey`
- `turtle`
- `tux`
- `udder`
- `vader`
- `vaderkoala`
- `www`

### Examples

```
 ________________________ 
< PowerShell is awesome! >
 ------------------------ 
     \   ^__^
      \  (oo)\_______
         (__)\       )\/\
             ||----w |
             ||     ||
```

```
 _________________ 
< Under the sea.. >
 ----------------- 
    \                                  ___-------___
     \                             _-~~             ~~-_
      \                         _-~                    /~-_
             /^\__/^\         /~  \                   /    \
           /|  O|| O|        /      \_______________/        \
          | |___||__|      /       /                \          \
          |          \    /      /                    \          \
          |   (_______) /______/                        \_________ \
          |         / /         \                      /            \
           \         \^\\         \                  /               \     /
             \         ||           \______________/      _-_       //\__//
               \       ||------_-~~-_ ------------- \ --/~   ~\    || __/
                 ~-----||====/~     |==================|       |/~~~~~
                  (_(__/  ./     /                    \_\      \.
                         (_(___/                         \_____)_)
```
