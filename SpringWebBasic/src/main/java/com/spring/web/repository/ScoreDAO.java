package com.spring.web.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.spring.web.model.ScoreVO;

@Repository("sDao1")
//@Scope("protype")
public class ScoreDAO implements IScoreDAO {
	
	//학생들의 점수정보를 저장할 리스트 생성(DB 대용)
	private List<ScoreVO> scoreList = new ArrayList<>();

	@Override
	public void insertScore(ScoreVO scores) {
		System.out.println("Repository param: " + scores);
		scoreList.add(scores);
	}

	@Override
	public List<ScoreVO> selectAllScores() {
		return scoreList;
	}

	@Override
	public void deleteScore(int stuNum) {
		scoreList.remove(stuNum);
	}

	@Override
	public ScoreVO selectOne(int stuNum) {
		return scoreList.get(stuNum);
	}

}





