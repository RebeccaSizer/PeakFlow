// Use newest nextflow dsl
nextflow.enable.dsl = 2

// Print pipeline configuration
log.info """\
    ============================================
          DNASeq Pipeline Configuration
    ============================================
    platform        : ${params.platform}
    samplesheet     : ${params.samplesheet}
    genome          : ${params.genome_file}
    genome index    : ${params.genome_index_files}
    genome index bowtie2 : ${params.bowtie2_index}
    index genome    : ${params.index_genome}
    qsr truth vcfs  : ${params.qsrVcfs}
    output directory: ${params.outdir}
    fastqc          : ${params.fastqc}
    fastp           : ${params.fastp}
    aligner         : ${params.aligner}
    variant caller  : ${params.variant_caller}
    bqsr            : ${params.bqsr}
    degraded_dna    : ${params.degraded_dna}
    variant_recalibration: ${params.variant_recalibration}
    identity_analysis: ${params.identity_analysis}
    ============================================
""".stripIndent()
