-- 1. ��¥�� ������� 2020�� ~ 2022�� 11���� 12���� �߻��� �����ǵ鸸 ����
SELECT
	CONVERT(date, [Purchase Date]) AS [Purchase Date], 	-- Purchase Date Į���� ������Ÿ�� ����
	SUM([Sales]) AS [Total Sales], 				-- �ش�Ǵ� ���� �Ǹž� �� �հ�
	COUNT(*) AS [Total Transactions] 			-- �ش�Ǵ� ���� �� �ŷ� �Ǽ�

FROM SalesData  						-- 1�������� ��ó�� �� �����͸� SalesData�� ��� 

WHERE
	( ([Purchase Date] >= '2020-11-01' AND [Purchase Date] < '2021-01-01') OR	-- �� �� 11������ 12�� �� �߻��� �����͸� ���͸� 
        ([Purchase Date] >= '2021-11-01' AND [Purchase Date] < '2022-01-01') OR
        ([Purchase Date] >= '2022-11-01' AND [Purchase Date] < '2023-01-01') 
    ) 

GROUP BY 
	CONVERT(date, [Purchase Date]) -- ��¥���� �׷�ȭ

ORDER BY
	CONVERT(date, [Purchase Date]); -- ��¥������ ����


-- 2. �Һ��� ���� ������ ������ ����� ���غ��� ���� �⵵�� �Ǹŷ��� �Ǹž� ���� ����

SELECT 
    YEAR([Purchase Date]) AS [Year],	-- �������� �׷�ȭ
    SUM([Sales]) AS [Total Sales],	-- �ش� ������ �� �Ǹž�
    COUNT(*) AS [Total Transactions]	-- �ش� ������ �� �ŷ� �Ǽ�

FROM SalesData


GROUP BY 
    YEAR([Purchase Date])		-- �������� �׷�ȭ

ORDER BY 
    YEAR([Purchase Date]);		-- �������� �׷�ȭ



-- 3. ������ ���� ��ȣ ǰ�� Ȯ�� �� �ŷ���/�ŷ��� Ȯ��
SELECT     
	[Gender], 
	[Product Category],
	SUM([Sales]) AS [Total Sales],
	COUNT(*) AS [Total Transactions]

FROM SalesData

GROUP BY 
	[Product Category],
	[Gender]

ORDER BY
	[Gender]