<!--#include file="AspCms_CompanyConfig.asp" -->
<!--#include file="AspCms_SeoConfig.asp" -->
<!--#include file="AspCms_TemplateConfig.asp" -->
<!--#include file="AspCms_CopyRightConfig.asp" -->
<!--#include file="AspCms_SlideConfig.asp" -->
<!--#include file="AspCms_ADConfig.asp" -->
<!--#include file="AspCms_OnlineServiceConfig.asp" -->
<%
Const sitePath=""  '��վĿ¼ ����:cms/
Const accessFilePath="AspCms_data/data.asp"  'access���ݿ��ļ�·��
Const htmlFilePath="html"  'htmlģ��·������ģ������
Const FileExt=".html"	'�����ļ���չ����htm,html,asp��
Const databaseType=0  '���ݿ����ͣ�0Ϊaccess��1Ϊsqlserver��
Const databaseServer="(local)"  'sqlserver���ݿ��ַ
Const databaseName="aspcms"  'sqlserver���ݿ�����
Const databaseUser="sa"  'sqlserver���ݿ��˺�
Const databasepwd="sa"  'sqlserver���ݿ�����
Const siteName=""  'վ������
Const siteNotice=""		'��վ���棨����վ�ر�ʱ��ʾ��
'������
Const siteMode=1	'��վ״̬��0Ϊ�رգ�1Ϊ���У�
Const SwitchFaq=0	'���Կ��أ�0Ϊ�رգ�1Ϊ������
Const SwitchFaqStatus=0	'������˿��أ�0Ϊ�����ã�1Ϊ���ã�
Const SwitchComments=0	'���ۿ��أ�0Ϊ�رգ�1Ϊ������
Const SwitchCommentsStatus=0	'��������Ƿ����ã�0Ϊ�����ã�1Ϊ���ã�
Const SwitchBBS=0	'��̳���أ�0Ϊ�رգ�1Ϊ������
Const waterMark=0	'ˮӡ
Const waterMarkFont=""	'ˮӡ����
Const waterMarkLocation=""	'λ��
Const upLoadPath="upLoad"	'�ϴ��ļ�Ŀ¼
Const textFilter=""	'�໰����
%>