tag: terminal
-

run script: "ts-node ./src/quotes/test-scripts/generate-dev-quote-data.ts\n"
local database: "mongodb://localhost:27017/main\n"
key(cmd-shift-d): "mongodb://localhost:27017/main\n"
bad local database: "mongodb://localhost:27017/localquotes\n"