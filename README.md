# ProjectSummer23
Remote code storage for GDS masters project

1. fastqc.sh is the initial experimental FastQC/multiQC that takes a directory as an input
2. Trim_MultiQC.sh is the initial script used to trim the data and follow up with a multiQC report
3. TrimMultiQC_2.sh is the updated version which takes directory names inside the target directory and uses that to generate output files.
4. SalmonScript.sh runs Salmon on a targeted file (input 1). NOTE: requires an index file to already be created (input 2).
5. DirectoryCopier.sh copies the names of all directories in target directory (input 1) and creates new directories with the same names in another directory (input 2).

The following .rmd files may require other files, documented appropriately. Additionally, they may require you to change filepaths to suit your filestructure.
1. Projecttest.Rmd is the file used to run DESeq2, svaseq an assorted functions required for this. Required files are SampleData_M_SIvG_Hipp.txt and SampleData_F_SIvG_Hipp.txt.
   Change sample names as appropriate to your samples in these .txt files. Also contains two functions for determining up and downregulated genes from sample data.
   Due to biomaRt servers and mirrors being down, there is also a function in here to convert ensembl mouse gene IDs to human homologs, this function requires Convert_ENSEMBL_MGI_HGNC.txt.
2. Pathwayanalysis.Rmd also contains the up/down regulated functions, takes in the results files from Projecttest.Rmd (mind the directories) and attempts to use biomaRt to convert these ensembl IDs to HGNC homologs.
   In the even that biomaRt does not respond, the other function that requires Convert_ENSEMBL_MGI_HGNC.txt can be subbed into its place. The homologs are then written to files for further use.
4. Celltypeanalysis.Rmd requires CellTypeData_annot_Zeisel.rda along with the malegenes.csv and femalegenes.csv from Pathwayanalysis.Rmd to perform bootstrap (# = 10,000) enrichment testing on our data.
   This is then written into male and female files.
5. Denovolyzer.Rmd requires malegenes.csv, femalegenes.csv, ALL_GENES.txt as well as the 6 different denovo_data.txt files. These tests were pasted into an Excel sheet to organise them before
   said excel sheet was used in our data, amending Poisson test results to the end of it. The end of this sheet is the interrogation of MAGMA analysis to determine common genes discussed in the report.
