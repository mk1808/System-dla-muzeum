package com.put.mguide.service.impl;

import java.io.IOException;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.put.mguide.model.File;
import com.put.mguide.repository.FileRepository;
import com.put.mguide.service.FileService;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private final FileRepository fileRepository;
	
	@Autowired
	public FileServiceImpl(FileRepository fileRepository) {
	super();
		this.fileRepository = fileRepository;
	}

	public File store(MultipartFile file) throws IOException {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		File FileDB = new File(fileName, file.getContentType(), file.getBytes());

		return fileRepository.save(FileDB);
	}

	public File getFile(Long id) {
		return fileRepository.findById(id).get();
	}

	public Stream<File> getAllFiles() {
		return fileRepository.findAll().stream();
	}

	public String deletFileById(Long id) {
		if (fileRepository.existsById(id)) {
			fileRepository.deleteById(id);
			return "File has been successfully deleted";
		}
		return "File doesn't exist";
	}
}
