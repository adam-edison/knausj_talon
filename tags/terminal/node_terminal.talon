tag: terminal
-
# npm commands
package install: insert("npm install\n")
package run$: insert("npm run\n")
package dev$: insert("npm run dev\n")
package <user.word>: insert("npm run {user.word}")
package <user.word> <user.word>: insert("npm run {user.word_1}:{user.word_2}")
package <user.word> <user.word> <user.word>: insert("npm run {user.word_1}:{user.word_2}:{user.word_3}")

# pnpm commands
perform install: insert("pnpm install\n")
perform <user.word>: insert("pnpm run {user.word}")
perform <user.word> <user.word>: insert("pnpm run {user.word_1}:{user.word_2}")
perform <user.word> <user.word> <user.word>: insert("pnpm run {user.word_1}:{user.word_2}:{user.word_3}")

# common npm scripts
update snapshots: insert("npm run test -- -u\n")
