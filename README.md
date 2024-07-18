# SQL query optimization: Decision program
Code of the master thesis of Daniela Böhm (TU Wien)  
with Dr. Pichler Reinhard, Dipl.-Ing. Selzer Alexander and Dr. Lanzinger Matthias

In this Readme all steps for executing the whole code are described.  
The master thesis is about desiging a decision program, which decides if the executing of a query on a DBMS or the rewritten form is faster, where the rewriting was provided in:  
Gottlob, G., Lanzinger, M., Longo, D. M., Okulmus, C., Pichler, R., & Selzer, A. (2023).
Structure-guided query evaluation: Towards bridging the gap from theory to
practice. arXiv:2303.02723. (https://doi.org/10.48550/arXiv.2303.02723)

## 1. Load the benchmark datasets
We use the following five benchmark datasets:    
*  STATS: Han, Y., Wu, Z., Wu, P., Zhu, R., Yang, J., Tan, L. W., Zeng, K., Cong, G., Qin, Y.,
Pfadler, A., Qian, Z., Zhou, J., Li, J., & Cui, B. (2021). Cardinality estimation
in DBMS: A comprehensive benchmark evaluation. Proc. VLDB Endow., 15 (4),
752–765. (https://doi.org/10.14778/3503585.3503586)
*  SNAP: Leskovec, J., & Krevl, A. (2014). SNAP Datasets: Stanford large network dataset collec-
tion. (https://snap.stanford.edu/data/)
*  JOB: Leis, V., Gubichev, A., Mirchev, A., Boncz, P., Kemper, A., & Neumann, T. (2015). How
good are query optimizers, really? Proc. VLDB Endow., 9 (3), 204–215. (https://doi.org/10.14778/2850583.2850594)
*  LSQB: Mhedhbi, A., Lissandrini, M., Kuiper, L., Waudby, J., & Szárnyas, G. (2021). Lsqb: A
large-scale subgraph query benchmark. GRADES-NDA ’21: Proceedings of the
4th ACM SIGMOD Joint International Workshop on Graph Data Management
Experiences and Systems and Network Data Analytics, 8, 1–11. (https://doi.org/10.1145/3461837.3464516)
*  HETIONET: Himmelstein, D. S., Lizee, A., Hessler, C., Brueggeman, L., Chen, S. L., Hadley, D.,
Green, A., Khankhanian, P., & Baranzini, S. E. (2017). Systematic integration of
biomedical knowledge prioritizes drugs for repurposing. eLife, 6, e26726. (https://doi.org/10.7554/eLife.26726)

And load them using: ```sudo docker-compose up -d``` to open Docker and execute this file: ```benchmark_data/benchmark/loading_benchmark_data.ipynb```  
which is mostly taken from the code at https://github.com/arselzer/spark-eval of the paper:
Lanzinger, M., Pichler, R., & Selzer, A. (2024). Avoiding materialisation for guarded
aggregate queries. arXiv:2406.17076.

## 2. Use data augmentation to create all queries we use
The filter augmentation was done by hand, by executing ```data_augmentation.ipynb``` the aggregate augmentation is done and all queries we use are saved in ```scala_commands_augment_filter_agg.txt```.

## 3. Produce rewriting in Scala
As a second step, we want to create the rewriting for each query using a Scala program and Calcite.  
The Scala code is provided in the scala folder and the program can be executed using this commands in a shell:  
```sudo service postgresql start```  
```./run_commands.sh```  
where the ```run_commands.sh``` executes each line as a shell command of the ```scala_commands_augment_filter_agg.txt```, where all augmented queries are listed.  
(In the Scala code replace the path with the path, where you want to save the rewriting.)

## 4. Executed the queries in both versions to get the runtimes
We want to executed all queries in their original and rewriten form against the DBMSs (Database Management Systems) we use: PostgreSQL (POS), DuckDB (DDB), SparkSQL (SPA).  
Use the following command to open Docker (the file is in the benchmark_data folder): ```sudo docker-compose up -d```  
Run ```run_queries_calcite_scala_augment-server-POS.ipynb```, ```run_queries_calcite_scala_augment-server-DDB.ipynb``` and ```run_queries_calcite_scala_augment-server-SPA.ipynb``` to get the runtimes of all queries for both versions.

## 5. Get the features
By executing the files ```features-POS.ipynb```, ```features-DDB.ipynb``` and ```features-SPA.ipynb``` we get all features we use for the different DBMSs.

## 6. Use the runtimes and features for designing and evaluating the decision program
The decision program is a Machine Learning model. We compare k-NN, decision tree, random forest, support vector machine, multi-layer perceptron, hypergraph neural networks and a combination of the latter two with different hyperparameter settings. Then we evaluate these models with quantitative and qualitative analysis, by using metrics and inspecting the misclassifications. Based on that we decide, which model is the best and therefore the decision program. This is the decision tree, which is then applied on the final test set to see how well it generealizes.  
We did that procedure for all our settings (runtimes of the different DBMSs and different features).  
This is done in the following notebooks: ```decision_program_augment-server-POS.ipynb```, ```decision_program_augment-server-POS-extraPOS.ipynb```, ```decision_program_augment-server-DDB.ipynb```, ```decision_program_augment-server-DDB-extraDDB.ipynb```, ```decision_program_augment-server-SPA.ipynb``` and ```decision_program_augment-server-SPA-extraPOS.ipynb```
