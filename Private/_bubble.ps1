# Private/_bubble.ps1

function _bubble {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message
    )
    
    $lines = $Message -split "`n"
    # Find the longest line for bubble width
    $contentLen = ($lines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
    $borderLen = $contentLen + 2
    
    $result = New-Object System.Text.StringBuilder
    
    # Top border
    [void]$result.AppendLine(" {0} " -f ('_' * $borderLen))
    
    if ($lines.Count -gt 1) {
        # Multi-line bubble
        # First line: / ... \
        [void]$result.AppendLine("{0} {1} {2}" -f '/', $lines[0].PadRight($contentLen), '\')
        
        # Middle lines: | ... |
        for ($i = 1; $i -lt ($lines.Count - 1); $i++) {
            [void]$result.AppendLine("{0} {1} {2}" -f '|', $lines[$i].PadRight($contentLen), '|')
        }
        
        # Last line: \ ... /
        [void]$result.AppendLine("{0} {1} {2}" -f '\', $lines[-1].PadRight($contentLen), '/')
    } else {
        # Single line: < ... >
        [void]$result.AppendLine("{0} {1} {2}" -f '<', $lines[0].PadRight($contentLen), '>')
    }
    
    # Bottom border
    [void]$result.AppendLine(" {0} " -f ('-' * $borderLen))
    
    return $result.ToString()
}
