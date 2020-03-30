apiVersion: v1
kind: Secret
metadata:
  name: {{ include "netbox.fullname" . }}
  labels:
    {{- include "netbox.labels" . | nindent 4 }}
data:
  {{- if .Values.secretKey }}
  secretKey: {{ .Values.secretKey | b64enc | quote }}
  {{- else }}
  secretKey: {{ randAlphaNum 64 | b64enc | quote }}
  {{- end }}
  dbPassword: {{ .Values.database.password | b64enc | quote }}
  redisHooksPassword: {{ .Values.redisHooks.password | b64enc | quote}}
  redisCachingPassword: {{ .Values.redisHooks.password | b64enc | quote}}
