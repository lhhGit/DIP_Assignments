这是我在网上的一个机器学习公开课的作业，做的是基于神经网络的手写数字识别，
用到了机器学习的内容，因此会有很多看起来比较“奇怪”的函数，下面对比较关键
的.m文件的作用进行解释:
ex4.m			主程序入口
fmincg.m		数学函数,它能实现cost function的值的迭代下降更快一些
nnCostFunction.m	cost function的计算，通过训练集实现cost function的值最小化
predict.m		识别函数，识别图像中的数字，它的输入不是简单的图像矩阵，需要
			先对它进行预处理

更多的算法流程描述详见ex4.pdf 

运行方式:
执行ex4.m文件即可，会依次经过显示测试集，训练神经网络，数字识别等步骤，每执行完一个步骤，程序会暂停
一下，按下回车便可继续，最后将会对测试集中的数字进行数字识别。 识别的准确率在95%左右。 

091250074 李皓寰