#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mentohust-proxy
PKG_VERSION:=4.0.0
PKG_RELEASE:=88c15a23bc0aebc8e4a748837ca0db500cc145ce

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.xz
PKG_SOURCE_URL:=https://github.com/Dark-Existed/mentohust-proxy.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_RELEASE)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:=Dark-Existed
PKG_LICENSE:=GPL-2.0

PKG_BUILD_DEPENDS:=gettext-full/host

include $(INCLUDE_DIR)/package.mk

define Package/mentohust-proxy/Default
  CATEGORY:=X
  SUBMENU:=Mentohust
  DEPENDS:= +libpcap
endef

define Package/mentohust-proxy
  $(call Package/mentohust-proxy/Default)
  TITLE:=Mentohust proxy
endef

define Package/mentohust-proxy/description
 Mentohust proxy
endef

define Build/Configure
endef

define Package/mentohust-proxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mentohust $(1)/usr/sbin/mentohust-proxy
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh )
	$(call Build/Configure/Default)
endef

$(eval $(call BuildPackage,mentohust-proxy))