{{/*
Expand the name of the chart.
*/}}
{{- define "echo.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "echo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "echo.labels" -}}
helm.sh/chart: {{ include "echo.chart" . }}
{{ include "echo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "echo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "echo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
