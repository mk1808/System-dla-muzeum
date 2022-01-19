package com.put.mguide.service;

import java.io.IOException;
import java.util.stream.Stream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.put.mguide.model.File;

@Service
public interface FileService {
	public File store(MultipartFile file) throws IOException;

	public File getFile(Long id);

	public Stream<File> getAllFiles();

	public String deletFileById(Long id);

}
