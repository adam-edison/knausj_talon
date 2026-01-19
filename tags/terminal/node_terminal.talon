tag: terminal
-
# npm commands
package install: insert("npm install\n")
package <user.word>: insert("npm run {user.word}\n")
package <user.word> <user.word>: insert("npm run {user.word_1}:{user.word_2}\n")
package <user.word> <user.word> <user.word>: insert("npm run {user.word_1}:{user.word_2}:{user.word_3}\n")

# pnpm commands
perform install: insert("pnpm install\n")
perform <user.word>: insert("pnpm run {user.word}\n")
perform <user.word> <user.word>: insert("pnpm run {user.word_1}:{user.word_2}\n")
perform <user.word> <user.word> <user.word>: insert("pnpm run {user.word_1}:{user.word_2}:{user.word_3}\n")

# common npm scripts
run lint: insert("npm run lint\n")
run test: insert("npm run test\n")
run test unit: insert("npm run test:unit\n")
run test integration: insert("npm run test:integration\n")
run test unit update: insert("npm run test:unit -- -u\n")
update snapshots: insert("npm run test -- -u\n")
