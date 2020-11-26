%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       决策树训练   %%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     输入参数说明   %%%%%%%%%%%%%%%%%%
%%%%data：样本数*属性
%%%%label：样本的判决借结果
%%%%propertyName：各属性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     输出参数说明   %%%%%%%%%%%%%%%%%%
%%%%decisionTreeModel：结果体，保存决策树

function decisionTreeModel = decisionTree(data,label,propertyName,delta)

global Node;  %全局变量

%%%level:节点位于决策树的第几层，根节点为0
%%%fatherNodeName：父节点的属性
%%%EdgeProperty：当前节点的属性值
%%%NodeName：当NodeName无子节点时，为判决结果值，当NodeName有子节点时，为子节点的属性
Node = struct('level',-1,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);

%%%递归构造决策树
BuildTree(-1,'root','Stem',data,label,propertyName,delta);

Node(1) = [];
model.Node = Node;
decisionTreeModel = model;

end
