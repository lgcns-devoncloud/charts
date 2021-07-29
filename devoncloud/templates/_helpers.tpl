{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "devoncloud.fullname" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "devoncloud.name" -}}
{{ .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "devoncloud.labels" -}}
{{ include "devoncloud.selectorLabels" . }}
{{- if .Chart.Version }}
app.kubernetes.io/chartVersion: {{ .Chart.Version | quote }}
{{- end }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/appVersion: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "devoncloud.selectorLabels" -}}
app.kubernetes.io/chartName: {{ .Chart.Name }}
app.kubernetes.io/releaseName: {{ .Release.Name }}
{{- end }}

