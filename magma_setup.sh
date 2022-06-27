magma_dir=magma_v1.10_mac

mkdir -p magma_out/step1
${magma_dir}/magma --annotate window=10,10 \
    --snp-loc ${magma_dir}/g1000_eur.bim \
    --gene-loc ${magma_dir}/NCBI38.gene.loc \
    --out magma_out/step1

gene_set_summary_statistics=$1
filename_arr=(${gene_set_summary_statistics//// })

mkdir -p magma_out/step2
${magma_dir}/magma \
    --bfile ${magma_dir}/g1000_eur \
    --pval ${gene_set_summary_statistics} use='SNP,P' ncol='N' \
    --gene-annot magma_out/step1.genes.annot \
    --out magma_out/step2/${filename_arr[1]}
