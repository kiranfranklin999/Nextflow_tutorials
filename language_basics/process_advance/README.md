### How to use docker, config and advanve condition logic to run?

Here, we have `nextflow.config` file, which has:


1. Process detail with container info
2. docker details i.e to enable

process{

    withName:INDEX{

        container = 'combinelab/salmon:latest'
        
    }
}
docker{
    enabled = true
}

To execute the file using docker and config:

`nextflow -C nextflow.config run process_index_with_docker.nf`

To execute the file without docker:

`nextflow run process_index_without_docker.nf`
