%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       ������ѵ��   %%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     �������˵��   %%%%%%%%%%%%%%%%%%
%%%%data��������*����
%%%%label���������о�����
%%%%propertyName��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     �������˵��   %%%%%%%%%%%%%%%%%%
%%%%decisionTreeModel������壬���������

function decisionTreeModel = decisionTree(data,label,propertyName,delta)

global Node;  %ȫ�ֱ���

%%%level:�ڵ�λ�ھ������ĵڼ��㣬���ڵ�Ϊ0
%%%fatherNodeName�����ڵ������
%%%EdgeProperty����ǰ�ڵ������ֵ
%%%NodeName����NodeName���ӽڵ�ʱ��Ϊ�о����ֵ����NodeName���ӽڵ�ʱ��Ϊ�ӽڵ������
Node = struct('level',-1,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);

%%%�ݹ鹹�������
BuildTree(-1,'root','Stem',data,label,propertyName,delta);

Node(1) = [];
model.Node = Node;
decisionTreeModel = model;

end
