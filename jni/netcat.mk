# Android build config for libftdi tests and examples to be run by test_app
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

LOCAL_PATH:= $(call my-dir)
NETCAT_ROOT := $(LOCAL_PATH)/netcat
NETCAT_VER := 0.7.1

DOWNLOAD:=$(and $(shell make -f $(LOCAL_PATH)/netcat_download.mk			\
		LOCAL_PATH=$(LOCAL_PATH)											\
		NETCAT_VER=$(NETCAT_VER)											\
	),)

# libftdi

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  $(NETCAT_ROOT)/src/core.c												\
  $(NETCAT_ROOT)/src/flagset.c											\
  $(NETCAT_ROOT)/src/misc.c												\
  $(NETCAT_ROOT)/src/netcat.c											\
  $(NETCAT_ROOT)/src/network.c											\
  $(NETCAT_ROOT)/src/telnet.c											\
  $(NETCAT_ROOT)/src/udphelper.c										\

LOCAL_C_INCLUDES := $(NETCAT_ROOT) $(LOCAL_C_INCLUDES)

LOCAL_CFLAGS += -DVERSION='"$(NETCAT_VER)"' -DHAVE_CONFIG_H

LOCAL_MODULE:= netcat

include $(or $(call DOWNLOAD),$(BUILD_EXECUTABLE))
