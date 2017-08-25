#!/usr/bin/env node

process.stdin.setEncoding('utf8');

let buffer = ''

process.stdin.on('readable', () => {
  const chunk = process.stdin.read()
  if (chunk != null) {
    buffer += chunk
  }
})

process.stdin.on('end', () => {
  let output = buffer
  let exitCode = 0

  try {
    output = JSON.stringify(JSON.parse(buffer), null, 2)
  } catch (e) {
    exitCode = 1
  }

  process.stdout.write(output)
  process.exit(exitCode)
})
