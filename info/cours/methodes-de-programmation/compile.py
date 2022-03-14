import os, subprocess, sys

print('Using ', os.getcwd(), ' as current folder')

def main():
  while True:
    inp = input('>').strip().lower()

    if inp.startswith('$'):
      file = inp[1:].strip()

      if file.startswith('#'):
        file = file[1:].strip()
        run_after = True
      else:
        run_after = False

      if file.endswith('.c'):
        file = file[:-2].strip()
      if file.endswith('.exe'):
        file = file[:-4].strip()

      output_file = get_output_file_name(file)

      exit_code = os.system(
        f'gcc {file}.c -o {file}.exe'
      )

      if os.name not in ('nt', 'dos'):
        os.system(f'mv {file}.exe {output_file}')


      if exit_code == 0 and run_after:
        print('Running the compiled result')
        print('===========================')
        os.system(f'.{os.path.sep}{output_file}')
      continue
    
    if inp.startswith('#'):
      file = inp[1:].strip()

      if file.endswith('.c'):
        file = file[:-2].strip()
      if file.endswith('.exe'):
        file = file[:-4].strip()

      os.system(f'.{os.path.sep}{get_output_file_name(file)}')
      continue

    if inp in ['q', 'quit', 'exit']:
      goodbye()
      continue
    
    if inp in ['²', 'clear', 'cls']:
      clear()
      continue
    
    if inp.startswith('!'):
      cmd = inp[1:].strip()
      os.system(cmd)
      continue
    
    if inp in ['?', 'h', 'help']:
      print('Simple C compilation program')
      print()
      
      lines = [
        ('q, quit, exit', 'exit the program'),
        ('$ [file]', 'compile a file'),
        ('# [file]', 'execute a file'),
        ('$ # [file]', 'compile and execute a file'),
        ('! [cmd]', 'execute a command'),
        ('², clear, cls', 'clear the screen'),
        ('@ $ [file]', 'auto compile on file change'),
        ('@ $ # [file]', 'auto compile and execute on file change'),
        ('@ # [file]', 'auto execute on file change'),
      ]

      indent = max(*[len(a) for a, _ in lines]) + 2
      for a, b in lines:
        print(a, ' ' * (indent - len(a)), b)
      
      print()
      print()
      continue
    
    if len(inp) > 0:
      print(f'Unknown command "{inp}"')

def clear():
  os.system('cls' if os.name in ('nt', 'dos') else 'clear')

def get_output_file_name(file):
  return f'{file}.exe' if os.name in ('nt', 'dos') else file

def goodbye():
  print()
  print('Goodbye')
  sys.exit(0)

if __name__=='__main__':
  try:
    main()

  except KeyboardInterrupt:
    goodbye()
