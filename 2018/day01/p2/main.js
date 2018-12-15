const fs = require('fs');

const data = fs
  .readFileSync('input.txt')
  .toString()
  .trim()
  .split('\n')
  .map(Number);

let sum = 0;
let sums = new Set([0]);
let i = 0;
while (true) {
  sum += data[i % data.length];
  if (sums.has(sum)) {
    console.log(sum);
    break;
  }

  sums.add(sum);
  i++;
}
