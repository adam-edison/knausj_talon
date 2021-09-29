tag: terminal
-

# TODO: AGE clean these up to be composable using python
app clean: "AWS_PROFILE=dev ./gradlew clean\n"
app run dev: "./gradlew clean && ./gradlew appRun -Pdeployment=dev\n"
app run work: "./gradlew clean && AWS_PROFILE=dev AWS_REGION=us-east-1 SPRING_PROFILES_ACTIVE=localWorkOrderService ./gradlew appRun > startup.log\n"
app run care: "./gradlew clean && sleep 2 && AWS_REGION=us-east-1 AWS_PROFILE=dev ./gradlew appRun > startup.log\n"
app debug care: "./gradlew clean && sleep 2 && AWS_REGION=us-east-1 AWS_PROFILE=dev ./gradlew appRunDebug > startup.log\n"
app test unit: "./gradlew clean && ./gradlew test -PexcludeIntegrationTests\n"
app test all: "./gradlew clean && ./gradlew test\n"
app war: 
    user.paste("./gradlew clean && sleep 2 && ./gradlew war -PgenerateLicenseAttribution=true && \\\n")
    user.paste("sleep 2 && git checkout src/main/webapp/WEB-INF/inc/tv/credits_attribution.inc && \\\n")
    user.paste("cp build/libs/home.war ~/ && \\\n")
    user.paste("echo \"WAR BUILT\"\n")
app config checkout: "git checkout src/main/config/common.properties && git checkout src/main/config/deployments/localhost/tomcat/server.xml\n"
app config apply: "git stash apply stash@{{0}}\n"

care install:
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/shared/nodejs && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_basic_auth_authorizer && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk\n")

care deploy dev: 
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/shared/nodejs && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_basic_auth_authorizer && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("npx cdk deploy --profile=dev PointClickCareStack-dev\n")

care deploy dev in prod:
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/shared/nodejs && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_basic_auth_authorizer && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("npx cdk deploy --profile=default PointClickCareStack-dev-in-prod\n")

care deploy qa in prod:
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/shared/nodejs && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_basic_auth_authorizer && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook && \\\n")
    user.paste("rm package-lock.json; rm -rf node_modules; npm install &&\\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("npx cdk deploy --profile=default PointClickCareStack-qa-in-prod\n")

care destroy dev: "cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && npx cdk destroy --profile=dev PointClickCareStack-dev\n"

directory touch town: "cd tt-"
directory work orders: "cd ~/files-shared/projects/tt-work-order-service/work-orders"
directory care [root]: "cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk\n"
directory (web app|java): "cd ~/files-shared/projects/tt-webapp\n"
directory talon: "cd ~/.talon/user/anti-rsi-talon\n"
directory care web hook: "cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook\n"
directory care authorizer: "cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_basic_auth_authorizer\n"
directory care shared: "cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/shared/nodejs\n"
directory core aws: "cd ~/files-shared/projects/tt-core-aws\n"

start databases:
    user.paste("docker container start webapp-sqlserver; docker container start webapp-postgresql\n")

care test all:
    user.paste("clear\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("npm run lint -- --fix && \\\n")
    user.paste("npm run test && \\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/shared/nodejs && \\\n")
    user.paste("npm run test-coverage && \\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_basic_auth_authorizer && \\\n")
    user.paste("npm run test-coverage && \\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook && \\\n")
    user.paste("npm run test-coverage && \\\n")
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk && \\\n")
    user.paste("echo \"------\n--- COMPLETE. ALL PASS.\n------\"\n")

care test watch:
    user.paste("cd ~/files-shared/projects/tt-aws_configuration_pointclickcare/cdk/lambdas/pcc_webhook && \\\n")
    user.paste("npm run test-watch\n")

check out configuration:
    user.paste("git checkout src/main/config/* && git checkout src/main/webapp/WEB-INF/applicationContext.xml\n")

check out care:
    insert("git checkout point-click-care-feature\n")

care rebase:
    insert("git rev-parse --abbrev-ref HEAD | pbcopy\n")
    sleep(500ms)
    branch = clip.text()
    print(branch)
    sleep(200ms)
    user.paste("""
    git checkout develop && git fetch -p && git pull && \
    git checkout point-click-care-feature && git pull && git rebase develop && \
    ./gradlew clean && ./gradlew test && git status && \
    git push --force-with-lease && \
    echo \"\n--\nCARE REBASE ONTO DEVELOP COMPLETE\n--\" && \
    git checkout {branch}
    """)

rebase onto care:
    insert("git rebase point-click-care-feature\n")
