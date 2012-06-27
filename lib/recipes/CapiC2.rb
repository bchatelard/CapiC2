require 'rubygems'
require 'yaml'
require 'aws-sdk'


#
# Note : the AWS should be initialized in your application
# you can do it using :
# AWS.config(YAML.load(File.read('EC2-credential.yml')))
#

Capistrano::Configuration.instance.load do

  def ec2_add_role_from_load_balancer(app_tag, load_balancer_name)
    elb = AWS::ELB.new

    lb = elb.load_balancers[load_balancer_name]
    unless lb.exists?
      puts load_balancer_name + " load balancer does not exist."
      exit 1
    end
    lb.instances.each do |instance|
      role app_tag, instance.private_dns_name
    end
  end

  def ec2_add_role_from_tag(app_tag, key, value_regex)
    ec2 = AWS::EC2.new

    # TODO we can optimize the fetching with describe_tags and a filtering
    ec2.instances.each do |instance|
      if instance.tags.has_key?(key) and instance.tags[key].match(value_regex) and instance.private_dns_name
        role app_tag, instance.private_dns_name
      end
    end
  end

end
