#!/usr/bin/env python

import sys
import string

FOREGROUND = '#EEEEEE'
BACKGROUND = '#181818'
ACCENT = '#0B76DE'
DISABLED = '#666666'

def array_into_string(arg_list):
	return_str = ''
	for item in arg_list:
		return_str += str(item) + ' '

	return return_str
	
def lemonbar_formatted(text):
	text = text.replace('{center}', '%{c}')
	text = text.replace('{fg}', ('%{F' + FOREGROUND + '}'))
	text = text.replace('{bg}', ('%{B' + BACKGROUND + '}'))
	text = text.replace('{accent}', ('%{F' + ACCENT + '}'))
	text = text.replace('{disabled}', ('%{F' + DISABLED + '}'))
	text = text.replace('{reset}', ('%{F-}%{B-}'))
	text = text.replace('{font=0}', '')
	text = text.replace('{font=1}', '')
	text = text.replace('{font=2}', '')
	text = text.replace('{font=3}', '')
	return text

def polybar_formatted(text):
	text = text.replace('{center}', '')
	text = text.replace('{font=0}', '%{T-}')
	text = text.replace('{font=1}', '%{T1}')
	text = text.replace('{font=2}', '%{T2}')
	text = text.replace('{font=3}', '%{T3}')
	text = lemonbar_formatted(text)
	return text

def main():
	output = str(sys.argv[1])
	formatted = array_into_string(sys.argv[2:])

	if output == 'lemonbar':
		formatted = lemonbar_formatted(formatted)
	elif output == 'polybar':
		formatted = polybar_formatted(formatted)

	print(formatted, end='')
	return

if __name__ == "__main__":
	main()
