apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "netbox.fullname" . }}
  labels:
    {{- include "netbox.labels" . | nindent 4 }}
data:
  {{- if .Values.database.host }}
  dbHost: {{ .Values.database.host }}
  {{- else }}
  dbHost: {{ .Release.Name }}-postgresql
  {{- end }}
  {{- if .Values.redisHooks.host }}
  redisHooksHost: {{ .Values.redisHooks.host }}
  {{- else }}
  redisHooksHost: {{ .Release.Name }}-redis-master
  {{- end }}
  {{- if .Values.redisCaching.host }}
  redisCachingHost: {{ .Values.redisCaching.host }}
  {{- else }}
  redisCachingHost: {{ .Release.Name }}-redis-master
  {{- end }}
