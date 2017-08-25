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
  process.stdout.write(JSON.stringify(JSON.parse(buffer), null, 2))
  process.exit(0)
})
