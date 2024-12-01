local util = require("common.util")

local pairs1 = {}
local pairs2 = {}

local inputStr = util.ReadFile("days/1/input.txt")
for num1, num2 in string.gmatch(inputStr, "(%d+)%s+(%d+)") do
    table.insert(pairs1, num1)
    table.insert(pairs2, num2)
end

table.sort(pairs1)
table.sort(pairs2)

local sumOfDiffs = 0
for i = 1, #pairs1 do
    local num1, num2 = pairs1[i], pairs2[i]
    local diff = num1 > num2 and num1 - num2 or num2 - num1

    sumOfDiffs = sumOfDiffs + diff
end

print("Part 1:", sumOfDiffs)

local similarityScore = 0
for _, num1 in next, pairs1 do
    local occurrences = 0
    for _, num2 in next, pairs2 do
        if num2 == num1 then
            occurrences = occurrences + 1
        end
    end

    similarityScore = similarityScore + (num1 * occurrences)
end

print("Part 2:", similarityScore)
