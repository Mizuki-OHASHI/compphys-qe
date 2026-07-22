import re
import sys
from pathlib import Path

text = Path(sys.argv[1]).read_text()
rows = re.findall(
    r"Interpolation grid:\s*(\d+).*?"
    r"AHC \(S/cm\).*?\n\s*=+\s+\S+\s+\S+\s+(\S+).*?"
    r"Total Execution Time\s+(\S+)",
    text,
    re.S,
)
print("k_mesh\tAHC_z\ttime_sec")
for row in rows:
    print(*row, sep="\t")
