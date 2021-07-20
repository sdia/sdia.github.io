module HelmUtils.QuestionsBasic exposing (questions)

import HelmUtils.Question as Question exposing (Answer, Question)


questions =
    [ Question
        "how to install the chart c/redis with release name rname?"
        "$ >"
        [ "helm install rname c/redis" ]
    , Question
        "how to install the chart c/redis with release name rname in the namespace ns?"
        "$ >"
        [ "helm install rname c/redis --namespace ns"
        , "helm install rname c/redis -n ns"
        ]
    , Question
        "how to install the chart c/redis with release name rname and override the default values with values.yaml?"
        "$ >"
        [ "helm install rname c/redis --values values.yaml" ]
    , Question
        "how to run a test install of c/redis named rname to validate and verify the chart?"
        "$ >"
        [ "helm install rname c/redis --dry-run --debug" ]
    , Question
        "how to upgrade the release named rname of c/redis"
        "$ >"
        [ "helm upgrade rname c/redis" ]
    , Question
        "how to rollback changes if the upgrade fails?"
        "$ >"
        [ "helm upgrade rname c/redis --atomic" ]
    , Question
        "How to upgrade a release and if it does not exist on the system, install it?"
        "$ >"
        [ "helm upgrade rname c/redis --install" ]
    , Question
        "How to upgrade to the specified version 1.0?"
        "$ >"
        [ "helm upgrade rname c/redis --version 1.0" ]
    , Question
        "How to roll back to the previous release?"
        "$ >"
        [ "helm rollback rname [revision]" ]
    , Question
        "How to roll back to a specific revision 3?"
        "$ >"
        [ "helm rollback rname 3" ]
    , Question
        "how to download all the release information?"
        "$ >"
        [ "helm get all rname" ]
    , Question
        "how to download all hooks of the release?"
        "$ >"
        [ "helm get hooks rname" ]
    , Question
        "how to download the manifestof the release?"
        "$ >"
        [ "helm get manifest rname" ]
    , Question
        "how to download the notes of the release?"
        "$ >"
        [ "helm get notes rname" ]
    , Question
        "how to download the values file of the release?"
        "$ >"
        [ "helm get values rname" ]
    , Question
        "how to fetch release history?"
        "$ >"
        [ "helm history rname" ]
    , Question
        "how to add a repository from the url https://repo.io and give it the name minio?"
        "$ >"
        [ "helm repo add minio https://repo.io" ]
    , Question
        "How to remove the repository miniofrom your system?"
        "$ >"
        [ "helm repo remove minio" ]
    , Question
        "how to update repositories?"
        "$ >"
        [ "helm repo update" ]
    , Question
        "how to list chart repositories?"
        "$ >"
        [ "helm repo list" ]
    , Question
        "Generate an index file containing charts found in the current directory?"
        "$ >"
        [ "helm repo index" ]
    , Question
        "how to search charts for the keyword bob?"
        "$ >"
        [ "helm search bob" ]
    , Question
        "how to search repositories for the keyword bob?"
        "$ >"
        [ "helm search repo bob" ]
    , Question
        "How to search Helm Hub for the keyword bob?"
        "$ >"
        [ "helm search hub bob" ]
    , Question
        "how to list all available releases in the current namespace?"
        "$ >"
        [ "helm list" ]
    , Question
        "how to list all available releases across all namespaces?"
        "$ >"
        [ "helm list --all-namespaces" ]
    , Question
        "how to list all releases in the specific namespace ns?"
        "$ >"
        [ "helm list --namespace ns" ]
    , Question
        "how to list all releases in a specified output format xxx?"
        "$ >"
        [ "helm list --output xxx" ]
    , Question
        "how to apply a filter to the list of releases using regular expressions *.bob.*?"
        "$ >"
        [ "helm list --filter '*.bob.*'" ]
    , Question
        "how to see the status of a specific release rname?"
        "$ >"
        [ "helm status rname" ]
    , Question
        "how to display the release history of the release rname?"
        "$ >"
        [ "helm history rname" ]
    , Question
        "How to see information about the Helm client environment?"
        "$ >"
        [ "helm env" ]
    , Question
        "how to install plugins abc/url1 and abc/url2?"
        "$ >"
        [ "helm plugin install abc/url1 abc/url2" ]
    , Question
        "how to view a list of all installed plugins?"
        "$ >"
        [ "helm plugin list" ]
    , Question
        "how to update plugin alice and plugin bob?"
        "$ >"
        [ "helm plugin update alice bob" ]
    , Question
        "how to create a directory containing the common chart files and directories?"
        "$ >"
        [ "helm create rname" ]
    , Question
        "how to package a chart located at path/chart into a chart archive?"
        "$ >"
        [ "helm package  path/chart/" ]
    , Question
        "how to run tests to examine a chart and identify possible issues?"
        "$ >"
        [ "helm lint c/redis" ]
    , Question
        "how to inspect a chart and list its contents?"
        "$ >"
        [ "helm show all c/redis" ]
    , Question
        "how to display a chart definition?"
        "$ >"
        [ "helm show chart c/redis" ]
    , Question
        "how to display the chart’s values?"
        "$ >"
        [ "helm show values c/redis" ]
    , Question
        "how to download a chart?"
        "$ >"
        [ "helm pull c/redis" ]
    , Question
        "how to download a chart and extract the archive’s contents into a directory /tmp/dir/?"
        "$ >"
        [ "helm pull c/redis --untar --untardir /tmp/dir/" ]
    , Question
        "how to display a list of a chart’s dependencies?"
        "$ >"
        [ "helm dependency list c/redis" ]
    , Question
        "how to display the general help output for Helm?"
        "$ >"
        [ "helm --help" ]
    , Question
        "how to show help for a particular helm command abc?"
        "$ >"
        [ "helm abc --help" ]
    , Question
        "how to see the installed version of Helm?"
        "$ >"
        [ "helm version" ]
    ]
