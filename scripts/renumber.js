#!/usr/bin/env node

process.stdin.setEncoding('utf8');

let buffer = ''

process.stdin.on('readable', () => {
  const chunk = process.stdin.read()
  if (chunk != null) {
    buffer += chunk
  }
})

const bulletRegex = new RegExp('^[0-9]+\\. *(.*)')

const formatBullet = (item, index, arr) => {
  const i = index + 1
  const spaces = arr.length.toString().length - i.toString().length + 1
  return `${i}.${' '.repeat(spaces)}${item}`
}

process.stdin.on('end', () => {
  let output = buffer
  let exitCode = 0

  try {
    const list = buffer.split('\n')
      .filter(x => x !== '')
      .map(x => x.match(bulletRegex) || [null, ''])
      .map(x => x[1])
      .map(formatBullet)

    output = list.join('\n')
  } catch (e) {
    exitCode = 1
  }

  process.stdout.write(output)
  process.exit(exitCode)
})
