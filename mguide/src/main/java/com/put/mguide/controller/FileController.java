package com.put.mguide.controller;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.put.mguide.model.File;
import com.put.mguide.other.Message;
import com.put.mguide.other.ResponseFile;
import com.put.mguide.service.FileService;

@RestController
@RequestMapping("/api/files")
public class FileController {

private final FileService fileService;
	
	@Autowired
	public FileController(FileService fileService) {
		super();
		this.fileService = fileService;
	}
	
	@PostMapping("/upload")
	public ResponseEntity<Message> uploadFile(@RequestParam("file") MultipartFile file) {
		String message = "";
		try {
			File newFile = fileService.store(file);

			message = "Uploaded the file successfully: " + file.getOriginalFilename();
			return ResponseEntity.status(HttpStatus.OK).body(new Message(message, newFile.getId()));
		} catch (Exception e) {
			message = "Could not upload the file: " + file.getOriginalFilename() + "!";
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new Message(message));
		}
	}

	@GetMapping("/files")
	public ResponseEntity<List<ResponseFile>> getListFiles() {
		List<ResponseFile> files = 
				fileService.getAllFiles().map(dbFile -> {
			String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/files/")
					.path(dbFile.getId().toString()).toUriString();

			return new ResponseFile(dbFile.getName(), fileDownloadUri, dbFile.getType(), dbFile.getData().length);
		}).collect(Collectors.toList());

		return ResponseEntity.status(HttpStatus.OK).body(files);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Object> getFile(@PathVariable Long id) {
		
		try {
			File fileDB = fileService.getFile(id);

			// Response type: byte[]
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileDB.getName() + "\"")
					.body(fileDB.getData());
		} catch (NoSuchElementException e) {
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new Message(e.getMessage()));
		}
	}
	
	@DeleteMapping("/files/{id}")
	public ResponseEntity<Message> deletFileById(@PathVariable Long id) {
		String message = "";
		message = fileService.deletFileById(id);
		return ResponseEntity.status(HttpStatus.OK).body(new Message(message));
		
	}
}
