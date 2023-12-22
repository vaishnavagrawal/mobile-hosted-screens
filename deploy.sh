
set -e  # exit on first error
rm -rf dist
pnpm run build 

#Copy execute_commands_on_ec2.sh file which has commands to be executed on server... Here we are copying this file
# every time to automate this process through 'deploy.sh' so that whenever that file changes, it's taken care of
#scp -i "compute-keypair.pem" execute_commands_on_ec2.sh ec2-user@ec2-13-235-248-72.ap-south-1.compute.amazonaws.com:/home/ec2-user
#echo "Copied latest 'execute_commands_on_ec2.sh' file from local machine to ec2 instance"

LOCAL_BUILD_PATH="dist"  # Update this with your local build path
EC2_USERNAME="ubuntu@ec2-3-109-153-140.ap-south-1.compute.amazonaws.com"
EC2_REMOTE_PATH="/home/ubuntu/ui-hosted/wip"
HTTP_SERVER_PORT="8082"  
EC2_COMMOND_PATH="~/execute_commands_on_ec2.sh"


scp -i  ~/.ssh/sandbox-keypair.pem -r "${LOCAL_BUILD_PATH}" "$EC2_USERNAME:${EC2_REMOTE_PATH}"
echo "Copied build file from local machine to ec2 instance"

echo "Connecting to ec2 instance and starting server"
echo "ssh -i  ~/.ssh/sandbox-keypair.pem ${EC2_USERNAME} "${EC2_COMMOND_PATH}" ${LOCAL_BUILD_PATH} ${HTTP_SERVER_PORT}"

# chmod +x ${EC2_COMMOND_PATH}
scp -i  ~/.ssh/sandbox-keypair.pem -r "execute_commands_on_ec2.sh" "$EC2_USERNAME:${EC2_REMOTE_PATH}"

ssh -i  ~/.ssh/sandbox-keypair.pem ${EC2_USERNAME} "${EC2_COMMOND_PATH}" ${LOCAL_BUILD_PATH} ${HTTP_SERVER_PORT}

# ssh -i  ~/.ssh/sandbox-keypair.pem ubuntu@ec2-3-109-153-140.ap-south-1.compute.amazonaws.com ./execute_commands_on_ec2.sh dist 8082
# ssh -i  ./execute_commands_on_ec2.sh dist 8082


# ssh -i  ~/.ssh/sandbox-keypair.pem ubuntu@ec2-3-109-153-140.ap-south-1.compute.amazonaws.com ./execute_commands_on_ec2.sh dist 8082