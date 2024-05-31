/*함수 실습 코드*/

--LENGTH--

--1.직원 이름의 길이 조회 이름 길이로 작성
SELECT EMP_ID,EMP_NAME,LENGTH(EMP_NAME) AS "이름길이"
FROM EMPLOYEE;

--2. 이메일 아이디의 길이 조회 이메일길이로 작성
SELECT EMP_ID,EMP_NAME,EMAIL,LENGTH(EMAIL) AS "이메일길이"
FROM EMPLOYEE
ORDER BY "이메일길이";

--3. 전화번호 길이가 11자리인 직원 조회 아이디 이름 번호
SELECT EMP_ID,EMP_NAME,PHONE,LENGTH(PHONE) AS "전화번호길이" FROM EMPLOYEE WHERE LENGTH(PHONE) <= 11 ORDER BY "전화번호길이";

--4. 이메일의 길이가 15자 이상인 직원 조회 아이디 이름 이메일 이메일 길이
SELECT EMP_ID,EMP_NAME,EMAIL,LENGTH(EMAIL) AS "이메일길이" FROM EMPLOYEE WHERE LENGTH(EMAIL) >= 15 ORDER BY "이메일길이";

--5 부서코드가 2글자인 직원 조회 아이디 이름 부서코드
SELECT EMP_ID,EMP_NAME,DEPT_CODE,LENGTH(DEPT_CODE) AS "부서코드" FROM EMPLOYEE WHERE LENGTH(DEPT_CODE) <=2 ORDER BY "부서코드";

--6 전화번호 010 이 포함된 직원 조회
SELECT EMP_ID,EMP_NAME,PHONE FROM EMPLOYEE WHERE INSTR(PHONE,'010')>0;

--> LIKE로 변경
SELECT EMP_ID,EMP_NAME,PHONE FROM EMPLOYEE WHERE PHONE LIKE '010%';

--SUBSTR 예제

--1. 이름의 세글자 가져오기 EMP_NAME AS이름_석자
SELECT SUBSTR(EMP_NAME,1,3)AS "이름석자" FROM EMPLOYEE ORDER BY "이름석자";
--2. 전화번호의 마지막 네자리 가져오기 -4 PHONE AS 마지막 네자리
SELECT SUBSTR(PHONE,-4) FROM EMPLOYEE;
--WHERE 절 IS NOT NULL 사용해서 출력가능
--3. 주민등록번호의 생년월일 추출 EMP NAME EMP_NO AS 생년월일
SELECT EMP_NAME,SUBSTR(EMP_NO,1,6) FROM EMPLOYEE;

--4. 전화번호의 앞 세자리 추출 PHONE AS 앞 세자리
SELECT EMP_NAME,SUBSTR(PHONE,1,3) FROM EMPLOYEE;

--5 이메일 @ 뒤에 있는 도메인 추출
SELECT EMP_NAME,SUBSTR(EMAIL,-5) FROM EMPLOYEE;

--올림 내림 반올림 활용해서 정수로 출력

--1. 올림
SELECT CEIL(AVG(SALARY)) FROM EMPLOYEE;
--2. 내림
SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE;
--3. 반올림
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;

/***COUNT 실습***/
--1. 전체 직원 수 조회 AS 총 직원수
SELECT COUNT(EMP_NAME)AS "총 직원수" FROM EMPLOYEE;

--2. WHERE 사용해서 D9부서 직원 수 조회 D9 부서 직원 수
SELECT COUNT(DEPT_CODE)AS "부서 직원 수" FROM EMPLOYEE WHERE DEPT_CODE = 'D9';
--3. WHERE 활용해서 보너스받은 직원수 보너스 받은 직원들
SELECT COUNT(BONUS) AS "보너스받은 직원수" FROM EMPLOYEE WHERE BONUS IS NOT NULL;

/** AVG 평균 구하기**/
--1. 전체 직원 평균 급여 조회 AS 평균 급여
SELECT FLOOR(AVG(SALARY))AS "평균급여" FROM EMPLOYEE;
--2. 부서별 평균 급여 조회 AS 부서 AS 평균 급여
select  avg(salary) as "평균 급여"
from employee;

select dept_code as "부서", avg(salary) as "평균 급여"
from employee
group by dept_code
;

--3. D5부서의 평균 급여 조회 AS D5 부서 평균 급여
SELECT AVG(SALARY)AS "D5부서평균급여"
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

/**REPLACE 활용 실습 **/ 

--1.이메일 주소에서 모든 점(.)을 하이픈(-) 대체 EMP_ID,EMAIL AS 수정된이메일
SELECT EMAIL,REPLACE(EMAIL,'.','-')AS "수정된 이메일" FROM EMPLOYEE;
--2.주민번호에서 모든 하이픈을 빈 문자열''로 대체 EMP_NAME,EMP_NO AS 수정된 주민번호
SELECT EMP_NAME,EMP_NO,REPLACE(EMP_NO,'-','')AS "수정된 주민번호" FROM EMPLOYEE;
--3.이름에서 김을 KIM으로 대체 NAME,AS "수정된이름
SELECT EMP_NAME,REPLACE(EMP_NAME,'김','KIM')AS "수정된이름" FROM EMPLOYEE;
--4.직무코드에서 J를 JOB으로 대치 아이디,코드 수정된 직무코드
SELECT JOB_CODE,REPLACE(JOB_CODE,'J','JOB')AS "수정된 직무코드" FROM EMPLOYEE;