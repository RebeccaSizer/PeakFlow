/*
 * Run fastq on the read fastq files
 */

process FASTQC {

    // Add a tag to identify the process - here I have used the sample ID
    tag "$sample_id"

    // Maps to a resource block in conf/base.config
    label 'process_single'

    // Docker container used for running the tool 
    container 'variantvalidator/fastqc:0.12.1'

    // Specify the output directory for the FASTQC results
    publishDir("$params.outdir/FASTQC", mode: "copy")

    // Tuple = expects a single item 
    // val = treat as a normal value (the sample ID)
    // path = path to the file - gets assigned to reads
    input:
    tuple val(sample_id), path(reads)

    // This says everything in the _logs folder is output (all files)
    output:
    path "fastqc_${sample_id}_logs/*"

    // Script to run the fastqc docker
    script:
    """
    echo "Running FASTQC"
    mkdir -p fastqc_${sample_id}_logs

    # Check the number of files in reads and run fastqc accordingly
    if [ -f "${reads[0]}" ] && [ -f "${reads[1]}" ]; then
        fastqc ${reads[0]} ${reads[1]} -o fastqc_${sample_id}_logs
    elif [ -f "${reads[0]}" ]; then
        fastqc ${reads[0]} -o fastqc_${sample_id}_logs
    else
        echo "No valid read files found for sample ${sample_id}"
        exit 1
    fi

    echo "FASTQC Complete"
    """
}