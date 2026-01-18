$ErrorActionPreference = "Stop"

gci -recurse -file |
    ? Name -like "*.exe" |
    select `
        Name, `
        { "{0:N2}MB" -f ($_.Length / 1MB) }