#!/bin/bash
#SBATCH --time=00:00:58 --partition=short
my_email=glaudanno@gmail.com
chosen_partition=gelifes
cd /home/$USER/
mkdir -p $project
cd /home/$USER/$project/

github=$1
project=$2
funname=$3
arguments=$4

mkdir -p ${funname}
mkdir -p logs

R_file_name=R-${funname}.R
bash_file_name=bash-${funname}.bash
job_name=${funname}-${arguments}

rm $R_file_name #remove previous versions
rm $bash_file_name #remove previous versions

echo "args <- as.numeric(commandArgs(TRUE))" > $R_file_name
echo "jap::run_function(github_name = ${github}, project_name = ${project}, function_name = ${funname}, arguments = ${arguments})" >> $R_file_name

echo "#!/bin/bash" > $bash_file_name
echo "#SBATCH --time=71:58:58" >> $bash_file_name
echo "#SBATCH --output=logs/bash-${funname}.log" >> $bash_file_name
echo "module load R" >> $bash_file_name
echo "Rscript $R_file_name ${arguments}" >> $bash_file_name
echo "rm $R_file_name" >> $bash_file_name
echo "rm $bash_file_name" >> $bash_file_name

#NEVER ASK FOR MORE THAN 9GB OF MEMORY!
sbatch  --partition=$chosen_partition \
		--mem=9GB \
		--job-name=$job_name \
		--mail-type=FAIL,TIME_LIMIT \
		--mail-user=$my_email \
		--output=logs/job-${job_name}.log \
		$bash_file_name
		
cd /home/$USER/
# ls | find . -name "slurm*" | xargs rm
