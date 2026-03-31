import subprocess
with open('output_clean.txt', 'w', encoding='utf-8') as f:
    result = subprocess.run('flutter analyze', capture_output=True, text=True, shell=True)
    f.write(result.stdout)
    f.write("\nERRORS:\n")
    f.write(result.stderr)
