# https://github.com/posener/complete/blob/v1/cmd/install/bash.go
# https://github.com/posener/complete/blob/9a4745ac49b29530e07dc2581745a218b646b7a3/cmd/install/install.go#L86-L89
{{- if lookPath "terraform" }}
complete -C {{ lookPath "terraform" }} terraform
{{- end -}}
