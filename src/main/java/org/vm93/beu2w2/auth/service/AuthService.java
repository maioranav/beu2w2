package org.vm93.beu2w2.auth.service;

import org.vm93.beu2w2.auth.payload.LoginDto;
import org.vm93.beu2w2.auth.payload.RegisterDto;

public interface AuthService {
    
	String login(LoginDto loginDto);
    String register(RegisterDto registerDto);
    
}
