{{- define "task-tracker.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "task-tracker.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "task-tracker.labels" -}}
app.kubernetes.io/name: {{ include "task-tracker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
environment: {{ .Values.environment }}
{{- end -}}

{{/* selector labels for one tier: call with (dict "ctx" . "tier" "backend") */}}
{{- define "task-tracker.selector" -}}
app.kubernetes.io/name: {{ include "task-tracker.name" .ctx }}
app.kubernetes.io/instance: {{ .ctx.Release.Name }}
app.kubernetes.io/component: {{ .tier }}
{{- end -}}
