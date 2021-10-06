tag: terminal
-
# Standard commands
package install save: "npm install --save\n"
package install save dev: "npm install --save-dev\n"
package [run] build: "npm run build\n"
package [run] lint: "npm run lint\n"
package [run] lint fix: "npm run lint -- --fix\n"
package [run] test: "npm run test\n"
package [run] test copy: "npm run test | pbcopy\n"
package run test unit: "npm run test-unit\n"
package run test integration: "npm run test-integration\n"
package run test coverage: "npm run test-coverage\n"
package run test end: "npm run test-e2e\n"
package run: "npm run "
package links lisa: "npm ls -g --depth=0 --link=true\n"