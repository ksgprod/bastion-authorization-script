BASTION_EC2_INSTANCE_ID=ID da instância EC2
KP_PEM_ABS_PATH=caminho absoluto do par de chave pem
RDS_SERVER=RDS host
RDS_LOCAL_PORT=porta local para mapeamento do banco
RDS_REMOTE_PORT=porta do banco remoto
REGION=us-east-1

BASTION_IP=$(aws ec2 describe-instances --instance-ids $BASTION_EC2_INSTANCE_ID --query "Reservations[].Instances[].PublicIpAddress" --region $REGION --output json | grep -vE '\[|\]' | awk -F'"' '{ print $2 }')

ssh -f -N -i $KP_PEM_ABS_PATH ec2-user@$BASTION_IP -L $RDS_LOCAL_PORT:$RDS_SERVER:$RDS_REMOTE_PORT

echo "------------------------------------------------------------------------"
echo "Acesso liberado para: "
echo "$RDS_SERVER no endereço *127.0.0.1:$RDS_LOCAL_PORT"
echo "------------------------------------------------------------------------"
