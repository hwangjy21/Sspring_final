package com.myweb.www.controller;

import javax.inject.Inject;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comment/*")
public class CommentController {

	
	@Inject
	private CommentService csv;
	
	@PostMapping(value = "post", consumes = "application/json", produces =  MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> post(@RequestBody CommentVO cvo){
		log.info(">>>>>cvo>>"+cvo);
		return csv.insert(cvo)>0?new ResponseEntity<String>("1", HttpStatus.OK):new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{bno}/{page}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> spread(@PathVariable("bno")long bno, 
			@PathVariable("page")int page){
		log.info(">>>> bno / page >> "+bno +"   "+page);
		
		PagingVO pgvo =  new PagingVO(page,5);
		return new ResponseEntity<PagingHandler>(csv.getList(bno,pgvo), HttpStatus.OK);
		
	}
	
	
	@PutMapping(value = "/{cno}", consumes ="application/json", 
			produces = MediaType.TEXT_PLAIN_VALUE )
	public ResponseEntity<String> edit(@PathVariable("cno")long cno,
	@RequestBody CommentVO cvo){
		return  csv.modify(cvo) > 0? new ResponseEntity<String>("1", HttpStatus.OK) : 
			new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		
		
	}
	
	@DeleteMapping(value="/del/{cno}/{writer}", produces = MediaType.APPLICATION_JSON_VALUE )
	public ResponseEntity<String> erase(@PathVariable("cno")long cno){
		
		int isOk = csv.remove(cno);
	
	return isOk > 0 ?  new ResponseEntity<String>("1", HttpStatus.OK) :
		new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	
}}
