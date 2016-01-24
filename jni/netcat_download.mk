# Android build config for libftdi examples to be run by test_app
# Copyright © 2016 Eugene Hutorny <eugnene@hutorny.in.ua>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

LOCAL_PATH := $(or $(LOCAL_PATH),$(shell pwd))
NETCAT_VER ?= 0.7.1
NETCAT_PATH := $(LOCAL_PATH)/netcat

NETCAT_BASE_URL ?= http://sourceforge.net/projects/netcat/files/netcat
NETCAT_TAR := netcat-$(NETCAT_VER).tar.gz
NETCAT_URL := $(NETCAT_BASE_URL)/$(NETCAT_VER)/$(NETCAT_TAR)

download:: $(NETCAT_PATH)/config.h

.PHONY: download

netcat_download.mk::;

$(LOCAL_PATH)/.dl:
	mkdir -p $@

$(LOCAL_PATH)/.dl/$(NETCAT_TAR): | $(LOCAL_PATH)/.dl 
	$(hide) wget -q -O $@ $(NETCAT_URL)

$(NETCAT_PATH)/configure.ac: $(LOCAL_PATH)/.dl/$(NETCAT_TAR) | $(LOCAL_PATH)/.dl
	$(hide) mkdir -p $(dir $@)
	$(hide) tar --strip-components 1 -xf $< -C $(dir $@)

$(NETCAT_PATH)/config.h: $(NETCAT_PATH)/configure.ac
	$(hide) cd $(dir $@); $(LOCAL_PATH)/autogen.sh 
